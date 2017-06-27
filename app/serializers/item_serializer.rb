class ItemSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :todo_id, :name, :done, :updated_at
end
