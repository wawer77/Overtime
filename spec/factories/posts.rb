FactoryBot.define do
  factory :post do
    date {Date.today}
    rationale {"Some rationale"}
  end
  
  factory :second_post, class: "Post" do
    date {Date.yesterday}
    rationale {"Some more rationale"}
  end
  
  factory :post_from_other_user, class: "Post" do
    date {Date.tomorrow}
    rationale {"Post from another user"}
  end
  
  
end