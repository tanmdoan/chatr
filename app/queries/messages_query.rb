class MessagesQuery
  attr_reader :relation, :filters

  def initialize(relation:, filters:)
    @relation = relation
    @filters = filters
  end

  class << self
    def resolve(relation:, filters: {})
      new(relation: relation, filters: filters).resolve
    end
  end

  def resolve
    scope = relation
    return scope.fresh if filters.empty?

    apply_filter(scope, :limit)
      .then { |scope| apply_filter(scope, :recipient_id) }
      .then { |scope| apply_filter(scope, :sender_id) }
      .then { |scope| apply_filter(scope, :date) }
  end

  private

  def apply_filter(scope, filter)
    return scope if filters[filter].nil? && filter != :date
    send("filter_by_#{filter}", scope, filters[filter])
  end

  def filter_by_limit(scope, value)
    scope.limit(value.to_i)
  end

  def filter_by_recipient_id(scope, value)
    scope.where(recipient_id: value)
  end

  def filter_by_sender_id(scope, value)
    scope.where(sender_id: value)
  end

  def filter_by_date(scope, value)
    return scope if filters[:limit]
    scope.fresh
  end
end

