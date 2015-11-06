# Be sure to restart your server when you modify this file.

module ActiveRecord
  class Base
    # With PostgreSQL 9.5, this could be rewritten to use INSERT ON CONFLICT DO UPDATE
    def self.upsert(attributes, by:)
      record = create! attributes.merge(by)
      record
    rescue ActiveRecord::RecordNotUnique, PG::UniqueViolation
      record = find_by(by)
      record.update attributes.merge(updated_at: Time.now.utc)
      record
    end
  end
end