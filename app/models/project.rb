class Project < ActiveRecord::Base
  after_initialize :generate_token

  has_many :buckets, dependent: :destroy

  validates :token, :uniqueness => {:message => 'already exists, please choose another token'}

  protected

  def generate_token
    self.token ||= loop do
      random_token = Digest::SHA1.hexdigest([Time.now, rand].join)[0..7]
      break random_token unless Project.exists?(token: random_token)
    end
  end
end
