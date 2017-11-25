
User.destroy_all

u1 = User.create :name => 'one', :email => 'one@email.com', :password => 'chicken'
u2 = User.create :name => 'two', :email => 'two@email.com', :password => 'chicken'
u3 = User.create :name => 'three', :email => 'three@email.com', :password => 'chicken'


Post.destroy_all
p1 = Post.create :image => 'one.jpeg', :caption: 'one' :comment => 'a'
p1 = Post.create :image => 'two.png', :caption: 'two' :comment => 'b'
p1 = Post.create :image => 'three.jpg', :caption: 'three' :comment => 'c'


u1.posts << p1
u2.posts << p2
u3.posts << p3
