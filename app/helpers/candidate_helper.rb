module CandidateHelper
  def profile_pic(candidate)
    if candidate.twitter_handle.present?
      "https://avatars.io/twitter/#{candidate.twitter_handle}"
    elsif candidate.photo_url.present?
      candidate.photo_url
    else
      ""
    end
  end
end
