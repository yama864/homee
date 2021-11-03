class Relation < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '母' },
    { id: 3, name: '父' },
    { id: 4, name: '祖父' },
    { id: 5, name: '祖母' },
    { id: 6, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :users
end