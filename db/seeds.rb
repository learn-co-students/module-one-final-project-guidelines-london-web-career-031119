

bob = User.create({name: "Bob"})
cob = User.create({name: "Cob"})
rob = User.create({name: "Rob"})

todo1 = Todo.create({task: "Take out garbage", priority: "High"})
todo2 = Todo.create({task: "Take out cat", priority: "Normal"})
todo3 = Todo.create({task: "Take out dog", priority: "Low"})
todo4 = Todo.create({task: "Take out fish", priority: "High"})

List.create([{user: bob, todo: todo1},
             {user: bob, todo: todo3},
             {user: cob, todo: todo2},
             {user: rob, todo: todo4}])
