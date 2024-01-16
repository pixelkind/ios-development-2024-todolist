//
//  ContentView.swift
//  AwesomeTodoList
//
//  Created by Garrit Schaap on 2024-01-16.
//

import SwiftUI

struct ContentView: View {
    @State private var todos = [Todo(title: "Build an app"), Todo(title: "Record the lecture")]
    @State var textInput = ""
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                HStack {
                    Image(systemName: todo.isDone ? "checkmark.circle" : "circle")
                    Text(todo.title)
                }
                .onTapGesture {
                    if let index = todos.firstIndex(where: { $0.id == todo.id }) {
                        todos[index].isDone.toggle()
                    }
                }
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    todos.remove(at: index)
                }
            })
            TextField("Enter new todo...", text: $textInput)
                .onSubmit {
                    todos.append(Todo(title: textInput))
                    textInput = ""
                }
        }
    }
}

#Preview {
    ContentView()
}
