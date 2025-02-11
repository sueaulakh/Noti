//
//  ContentView.swift
//  notid
//
//  Created by HAPPY on 09/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

import SwiftUI


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (default alpha = 1)
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0) // Default to black for invalid hex
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255.0,
            green: Double(g) / 255.0,
            blue: Double(b) / 255.0,
            opacity: Double(a) / 255.0
        )
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Divider()
                        .background(Color.gray) 
                        
                        .frame(width: 399, height: 10)
                // Top Section (Today and Weather)
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Button(action: {
                                print("Add task tapped")
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(Color(hex: "#3858EF")) 
                                    .font(.title2)
                                    .padding(.top, 16)


                            }
                            
                            Text("Today")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.leading, 4)
                                .padding(.top, 16)
                        }

                            Text("Friday, January 16th, 2025")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.leading, 41)
                    }

                    Spacer()

                    HStack {
                        Text("11 °C") // Degree symbol
                            .font(.title3)

                        Image(systemName: "sun.max.fill")
                            .foregroundColor(.yellow)
                            .font(.title2)
                    }
                }
                .padding(.horizontal)

                // Greeting Section
                Text("Good morning Sue, How are you today?")
                   
                    .font(.body)
                    .padding(.horizontal)
                    .padding(.top, 29)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 14)
                

                // Daily Tasks Section
                VStack(alignment: .leading) {
                    Text("Daily Tasks")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 4)
                    Divider()
                        .background(Color.gray) 

                    // Task List
                    VStack(spacing: 12) {
                        TaskRow(task: "Assignment", time: "12:00", isCompleted: false)
                        TaskRow(task: "Gym", time: "18:00", isCompleted: false)
                        TaskRow(task: "Breakfast", time: "8:00", isCompleted: true)
                    }
                }
                .frame(width: 290, height: 200)
                .padding(.horizontal)
                .padding(.top, 2)
                .frame(maxWidth: .infinity, alignment: .center)
                Spacer()

                // Floating Calendar Button
                HStack {
                    Spacer()

                    Button(action: {
                        print("Open calendar tapped")
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#3858EF"))
                                .frame(width: 45, height: 56)

                            Image("calendar_month_24dp_FFFFFF_FILL0_wght400_GRAD0_opsz24")
                                .resizable()
                                   .scaledToFit()
                                   .frame(width: 29, height: 30)
                        }
                    }
                    .padding()
                }
            }
          
            .navigationBarItems(leading: Button(action: {
                print("Menu tapped")
            }) {
                Image(systemName: "line.horizontal.3")
                    .foregroundColor(.black)
            }, trailing: HStack {
                Image(systemName: "bell")
                    .foregroundColor(.black)

                Circle()
                    
                    .fill(Color(hex: "#3858EF"))
                    .frame(width: 30, height: 30)
                    .overlay(
                        Text("S")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .bold))
                    )
            })
        }
    }
}

struct TaskRow: View {
    let task: String
    let time: String
    let isCompleted: Bool

    var body: some View {
        HStack {
            Button(action: {
                print("\(task) checkbox tapped")
            }) {
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isCompleted ? Color(hex: "#3858EF") : Color(hex: "#3858EF"))

                    .font(.title3)
            }

            Text(task)
                .font(.body)
                
                .foregroundColor(isCompleted ? .black : .black)

            Spacer()

            Text(time)
                .font(.body)

            Image(systemName: "chevron.right.circle")
                .foregroundColor(.orange)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
