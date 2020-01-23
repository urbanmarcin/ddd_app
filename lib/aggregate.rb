module Aggregate
  def with_aggregate(aggregate_class, aggregate_id, &block)
    repository = AggregateRoot::InstrumentedRepository.new(
      AggregateRoot::Repository.new(Rails.configuration.event_store),
      ActiveSupport::Notifications
    )
    aggregate = aggregate_class.new(aggregate_id)
    stream = "#{aggregate_class.name}$#{aggregate_id}"
    repository.with_aggregate(aggregate, stream, &block)
  end
end
