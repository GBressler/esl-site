class Contact
	include ActiveModel::Model
	attr_accessor :first_name, :string
	attr_accessor :last_name, :string
	attr_accessor :email, :string
	attr_accessor :content, :string


	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :email
	validates_presence_of :content
	validates_format_of :email,
		:with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
	end