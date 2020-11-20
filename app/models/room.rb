class Room < ApplicationRecord
   
  with_options presence: true do
      validates :job_world
      validates :job_contents
      validates :room_condition
  end
    
    
    belongs_to:user
    
    def user
      return User.find_by(id:self.user_id)
    end
   
    enum job_world: { 金融・保険: 1, IT・インターネット: 2, 広告: 3, 商社: 4, 教育: 5, 人材: 6, メーカー: 7, 
    マスコミ・メディア: 8, インフラ: 9, メディカル: 10, 流通・小売・サービス: 11, 
    コンサルティング: 12, 官公庁: 13, その他: 14}, _prefix: true
   
    enum job_contents: { 営業: 1, 人事: 2, マーケティング: 3, 企画: 4, コンサル: 5, 経理・財務: 6, エンジニア: 7, デザイナー: 8, 研究開発: 9,
    総合職: 10, 一般職: 11, その他: 12}, _prefix: true
   
    enum room_condition: { 志望業種が同じ方: 1, 志望職種が同じ方: 2, 誰でも可: 3, 男性の方: 4, 女性の方: 5, その他: 6}, _prefix: true
end