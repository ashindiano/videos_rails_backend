class Video < ApplicationRecord
    belongs_to :category
    mount_uploader :video, VideoUploader, mount_on: :video
    serialize :video, JSON 
    # process_in_background :video
    
    def set_success(format, opts)
        self.success = true
    end
    
    def thumbnail_url
        if video_processing
        ""
        else
        video.thumb.url
        end
    end
    
    # All attachables should have the image_path method, this is sent to API
    def image_path
        thumbnail_url
    end
    
    def video_path
        # Serve the raw video until the processing is done.
        if video_processing
        video.url
        else
        video.rescaled.url
        end
    end

    default_scope { where(:is_active => true) }
end
