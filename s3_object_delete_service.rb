class S3ObjectDeleteService
  def self.call(object_key)
    creds = Aws::Credentials.new(Rails.application.credentials.s3_access_key_id!,
                                 Rails.application.credentials.s3_secret_key!)
    s3 = Aws::S3::Resource.new(region: Rails.application.credentials.s3_region!, credentials: creds)

    s3.bucket(Rails.application.credentials.s3_storage_bucket!).object(object_key).delete
  end
end

# Rails.application.credentials.s3_storage_bucket!         your S3 bucket name example: development-test-storage
# Rails.application.credentials.s3_access_key_id!          your AWS access key
# Rails.application.credentials.s3_secret_key!             your AWS secret key
# Rails.application.credentials.s3_region!                 your S3 bucket region example: eu-central-1
  
# in your Gemfile add   gem 'aws-sdk-s3'
