# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create(
  [
    { email: 'a@a.com', name: "Mrs. Aardvark", password: "a", password_confirmation: "a"},
    { email: 'b@b.com', name: "Mrs. Bear", password: "b", password_confirmation: "b"},
    { email: 'c@c.com', name: "Mrs. Cat", password: "c", password_confirmation: "c"},
    { email: 'd@d.com', name: "Mrs. Dog", password: "d", password_confirmation: "d"},
    { email: 'e@e.com', name: "Mrs. Elephant", password: "e", password_confirmation: "e"},
    { email: 'f@f.com', name: "Mrs. Fox", password: "f", password_confirmation: "f"},
    { email: 'g@g.com', name: "Mrs. Gopher", password: "g", password_confirmation: "g"},
    { email: 'h@h.com', name: "Mrs. Horse", password: "h", password_confirmation: "h"},
    { email: 'i@i.com', name: "Mrs. Iguana", password: "i", password_confirmation: "i"},
    { email: 'j@j.com', name: "Mrs. Jackrabbit", password: "j", password_confirmation: "j"},
    { email: 'k@k.com', name: "Mrs. Kangaroo", password: "k", password_confirmation: "k"},
    { email: 'l@l.com', name: "Mrs. Lama", password: "l", password_confirmation: "l"},
    { email: 'm@m.com', name: "Mrs. Mouse", password: "m", password_confirmation: "m"},
    { email: 'n@n.com', name: "Mrs. Numbat", password: "n", password_confirmation: "n"},
    { email: 'o@o.com', name: "Mrs. Opossum", password: "o", password_confirmation: "o"},
    { email: 'p@p.com', name: "Mrs. Peacock", password: "p", password_confirmation: "p"},
    { email: 'q@q.com', name: "Mrs. Quail", password: "q", password_confirmation: "q"},
    { email: 'r@r.com', name: "Mrs. Rabbit", password: "r", password_confirmation: "r"},
    { email: 's@s.com', name: "Mrs. Snake", password: "s", password_confirmation: "s"},
    { email: 't@t.com', name: "Mrs. Tiger", password: "t", password_confirmation: "t"},
    { email: 'u@u.com', name: "Mrs. Urial", password: "u", password_confirmation: "u"},
    { email: 'v@v.com', name: "Mrs. Vulture", password: "v", password_confirmation: "v"},
    { email: 'w@w.com', name: "Mrs. Wombat", password: "w", password_confirmation: "w"},
    { email: 'x@x.com', name: "Mrs. Xerox", password: "x", password_confirmation: "x"},
    { email: 'y@y.com', name: "Mrs. Yak", password: "y", password_confirmation: "y"},
    { email: 'z@z.com', name: "Mrs. Zebra", password: "z", password_confirmation: "z"},
  ]
)
