module AwsService
  def save_image_to_s3(base64Image)
    s3 = create_s3_client_instance

    key = get_name_by_base64(base64Image)
    encoded_string = splitBase64(base64Image)
    stringIO_img = Base64.decode64(encoded_string)
    bucket_name = "example-avatars-bckt"

    s3.put_object(bucket: bucket_name, key: key, body: stringIO_img, acl: "public-read")
    "https://s3-us-west-2.amazonaws.com/#{bucket_name}/#{key}"
  end

  private
    def get_name_by_base64(base64)
      base64.match(/^data:image\/(.*?);/)
      "#{current_user.id}_avatar.#{$1}" 
    end

    def splitBase64(uri)
      if uri.match(/,(.*)$/)
        $1
      end
    end

    def create_s3_client_instance
      Aws.config.update({
        region: 'us-west-2',
        credentials: Aws::Credentials.new(ENV['ACCESS_KEY_ID'], ENV['SECRET_KEY'])
      })

      Aws::S3::Client.new
    end
end