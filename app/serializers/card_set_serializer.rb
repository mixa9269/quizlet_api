# frozen_string_literal: true

class CardSetSerializer < ActiveModel::Serializer
  attributes :id, :author, :title

  def owner
    object.user
  end

  def author
    { id: owner.id, username: owner.username }
  end
end
