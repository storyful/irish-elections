module CandidateHelper
  def profile_pic(candidate)
    if candidate.photo_url.present?
      candidate.photo_url
    elsif candidate.twitter_handle.present?
      "https://avatars.io/twitter/#{candidate.twitter_handle}"
    else
      image_url('avatar.jpg')
    end
  end
end
