class User < ActiveRecord::Base
	validates :username, presence: true, length:{minimum: 3, maximum:25}
end