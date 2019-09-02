class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  module YoutubeEmbed
  end

end
