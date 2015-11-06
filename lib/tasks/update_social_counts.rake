namespace :social do
  desc "Update twitter counts for all candidates."
  task :update_twitter_counts do
    candidates = Candidate.where.not(twitter_url: nil)

    candidates.each do |candidate|
      twitter_username = candidate.twitter_url.match(%r{^\w+://twitter.com/(\w+)}i)[1] rescue nil
      next unless twitter_username.present?

      followers_count = begin TwitterService.new.user(twitter_username).followers_count
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