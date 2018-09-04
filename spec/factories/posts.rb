FactoryBot.define do
  factory :post do
    user
    date {Date.today}
    rationale {"Some rationale"}
  end
  
  factory :second_post, class: "Post" do
    user
    date {Date.yesterday}
    rationale {"Some more rationale"}
  end
end