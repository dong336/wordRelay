//
//  ContentView.swift
//  wordRelay
//
//  Created by 김동운 on 2024/06/28.
//

import SwiftUI

struct ContentView: View {
    let title: String = "끝말잇기 게임"
    @State var nextWord: String = ""
    @State var words: [String] = ["물컵", "컵받침", "침착맨"]
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .bold()
                .padding(.vertical, 16)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.teal)
                        .opacity(0.2)
                        .shadow(radius: 5)
            )
                .padding(.top, 10)
            
            HStack {
                TextField("단어를 입력하세요", text: $nextWord)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                )
                
                Button(action: {
                    print("입력하신 단어는: ", nextWord)
                    
                    // 사용자가 입력한 단어: nextWord
                    // 단어들의 목록: words
                    
                    if words.last?.last?.lowercased() == nextWord.first?.lowercased() {
                        // 성공
                        words.append(nextWord)
                        nextWord = ""
                    } else {
                        // 실패
                        showAlert = true
                        nextWord = ""
                    }
                    
                }, label: {
                    Text("확인")
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                        )
                })
                    .alert("끝말이 이어지는 단어를 입력해주세요.", isPresented: $showAlert) {
                        Button("확인", role: .cancel) {
                            showAlert = false
                        }
                    }
            }
            .padding(.horizontal)
            .padding(.top)
            
            List {
                ForEach(words.reversed(), id: \.self) { word in
                    Text(word)
                        .font(.title2)
                }
                
            }
            .listStyle(.plain)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
