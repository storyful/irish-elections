namespace :social do
  desc "Update twitter counts for all candidates."
  task :update_twitter_counts do
    candidates = Candidate.where.not(twitter_handle: nil)

    candidates.each do |candidate|
      next unless twitter_handle.present?

      followers_count = begin TwitterService.new.user(twitter_handle).followers_count
      rescue Twitter::Error::NotFound
        nil
      end

      next unless followers_count.present?
      puts "Update twitter counts for: #{candidate.full_name} - #{followers_count} followers"
      attributes = { twitter_followers_count: followers_count, candidate_id: candidate.id }
      SocialCount.upsert(attributes, by: { date: Date.today.iso8601 })
    end

  end
end