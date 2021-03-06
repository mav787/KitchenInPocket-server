class Step < ActiveRecord::Base

  belongs_to :recipe

  def to_json_obj fields = nil
    obj = {}
    default = ["id", "recipe_id", "index", "content"]
    fields ||= default
    fields.each do |key|
      obj.store(key, instance_eval("self.#{key}")) if default.include? key
    end
    obj
  end
end