p "create Categories"
Category.create!(
  name: 'グルテンフリー'
)
Category.create!(
  name: 'ヴィーガン'
)
Category.create!(
  name: 'オーガニック'
)
Category.create!(
  name: '腸内環境'
)
Category.create!(
  name: 'エシカル食品'
)
Category.create!(
  name: 'アーユルヴェーダ'
)
Category.create!(
  name: 'サステナブルビューティー'
)
Category.create!(
  name: 'その他'
)

MenuCategory.create!(
  [
    {
      name: 'グルテンフリー'
    },
    {
      name: 'ヴィーガン'
    },
    {
      name: 'オーガニック'
    },
    {
      name: '腸内環境'
    },
    {
      name: 'エシカル食品'
    },
    {
      name: 'アーユルヴェーダ'
    },
    {
      name: 'サステナブルビューティー'
    },
    {
      name: 'その他'
    }
  ]
)