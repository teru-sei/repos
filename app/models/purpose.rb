class Purpose < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' }
    { id: 1, name: 'コーヒー' }
    { id: 2, name: '紅茶' }
    { id: 3, name: 'スイーツ' }
    { id: 4, name: 'オシャレ' }
  ]

  include ActiveHash::Associations
  has_many :cafes
end