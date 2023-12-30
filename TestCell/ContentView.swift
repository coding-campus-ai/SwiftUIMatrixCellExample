//
//  ContentView.swift
//  TestCell
//
//  Created by Jihun Kang on 12/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var boxes: [String] = []
    
    @State private var currentPlayer: String = ""
    @State private var cells: [[String?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3)
    
    @State var number = 0
    @State var mStateRow = 0
    @State var mStateColumn = 0
    @State private var winningCells: Set<[Int]> = []
    @State private var animate = false

    var body: some View {
        VStack(spacing: 20) {
            
            ForEach(0..<3) { row in
                HStack(spacing: 20) {
                    ForEach(0..<3) { column in
                        Button(action: {
                               // currentPlayer = //currentPlayer == .x ? .o : .x
                                //checkWinner()
                            print("\(String(describing: cells[row][column]))")
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(currectColor(row, column))
                                    .frame(width: 80, height: 80)
                                    .shadow(radius: currectShadow(row,column))
                                Text(cells[row][column] ?? "")
                                    //.font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        })
                        //.disabled(winner == nil ? false : true)
                        .scaleEffect(winningCells.contains([row, column]) ? 1.2 : 1.0)
                        .animation(.easeInOut, value: animate)
                        //.animation(.easeInOut(duration: 0.5))
                        .onAppear{animate = true}
                    }
                }
            }


            Button("Add Box") {
                // 새로운 상자를 추가하려면 배열에 요소를 추가합니다.
                if( number < 9 ){
                    mStateRow = number / 3
                    mStateColumn = number % 3
                    let index = mStateRow*3+mStateColumn
                    
                    boxes.append("New Box")
                    
                    
                    cells[mStateRow][mStateColumn] =  boxes[index]
                    number = number + 1
                    
                    //  print("\row \(mStateRow) colum \(colum) \(number)")
                }
            }
        }
    }
    
    
    func currectColor(_ row:Int,_ column:Int)->Color{
        if cells[row][column] == "" {
            return .red
        }else if cells[row][column] == nil{
            return .white
        }
        return .blue
    }
    
    func currectShadow(_ row:Int,_ column:Int)->CGFloat{
        if cells[row][column] == "" {
            return 5
        }else if cells[row][column] == nil{
            return 0
        }
        return 5
    }
}

#Preview {
    ContentView()
}
