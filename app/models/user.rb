class User < ActiveRecord::Base
  has_many :ptexts, dependent: :destroy
  has_many :stexts, dependent: :destroy
  acts_as_voter

  has_secure_password

  before_create :set_token
  after_find :fix_up_token

  validates :email, uniqueness: true

  def authenticate_with_new_token(password)
    authenticate_without_new_token(password) && new_token
  end

  alias_method_chain :authenticate, :new_token

  has_attached_file :avatar,
  :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "/images/:style/missing.png",
  :storage => :s3,
  :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
  :s3_host_name => 's3-us-west-2.amazonaws.com',
  :url => ':s3_domain_url',
  :path => '/:class/:attachment/:id_partition/:style/:filename'

  def s3_credentials
    {:bucket => ENV['S3_BUCKET_NAME'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  private

  # FIXME: Validate that token doesn't exist? (improbable)
  def set_token
    self.token = SecureRandom.hex(16)
  end

  # unconditionally create and set a new token
  def new_token
    update_columns(token: set_token, updated_at: Time.current)
  end

  # expire old token
  def fix_up_token
    # FIXME: token age should be configurable
    new_token if updated_at < 1.day.ago
  end
end

