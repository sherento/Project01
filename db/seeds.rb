
User.destroy_all
u1 = User.create :name => 'one', :email => 'one@email.com', :password => 'chicken'
u2 = User.create :name => 'two', :email => 'two@email.com', :password => 'chicken'
u3 = User.create :name => 'three', :email => 'three@email.com', :password => 'chicken'


Post.destroy_all
p1 = Post.create :title => 'tester1', :caption => 'does this work?1'
p2 = Post.create :title => 'tester2', :caption => 'does this work?2'
p3 = Post.create :title => 'tester3', :caption => 'does this work?3'

Comment.destroy_all
c1 = Comment.create :content => 'this is commenting on a post, yay'
c2 = Comment.create :content => 'Another post about stuff'
c3 = Comment.create :content => 'I did it'
c4 = Comment.create :content => 'Wow, lolz, gr8 stuff'
c5 = Comment.create :content => 'blah blah blah'
c6 = Comment.create :content => 'comment again'

u1.posts << p1
u2.posts << p2
u3.posts << p3

p1.comments << c1
p1.comments << c2
p2.comments << c3
p2.comments << c4
p3.comments << c5
p3.comments << c6

u1.comments << c1
u1.comments << c2
u2.comments << c3
u2.comments << c4
u3.comments << c5
u3.comments << c6
