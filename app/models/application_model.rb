# http://blog.joshdzielak.com/blog/2012/04/14/update-to-previous-mongoid-id-serialization-fix/
class ApplicationModel
  class << self
    def inherited(base)
      base.class_eval do
        include Mongoid::Document

        # juicy bits
        serializable_hash_method = instance_method(:serializable_hash)
        define_method :serializable_hash do |options=nil|
          self.attributes["id"] = self.persisted? ? self._id : nil
          serializable_hash_method.bind(self).call(options)
        end

      end
    end
  end
end