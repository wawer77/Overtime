FactoryBot.define do
  factory :post do
    date {Date.today}
    rationale {"Some rationale"}
    overtime_request {2.5}
  end
  
  factory :second_post, class: "Post" do
    date {Date.yesterday}
    rationale {"Some more rationale"}
    overtime_request {0.5}
  end
  
  factory :post_from_other_user, class: "Post" do
    date {Date.tomorrow}
    rationale {"Post from another user"}
    overtime_request {2.5}
  end
  
  
end