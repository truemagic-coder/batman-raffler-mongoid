# http://autonomousmachine.com/posts/2012/5/5/use-active-model-serializers-with-mongoid
Mongoid::Document.send(:include, ActiveModel::SerializerSupport)
Mongoid::Criteria.delegate(:active_model_serializer, to: :to_a)