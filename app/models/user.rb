class User < ActiveRecord::Base
	validates :username, presence: true, lenght:{minimum: 3, maximum:25}
end