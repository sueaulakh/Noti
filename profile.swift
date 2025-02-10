//
//  profile.swift
//  notid
//
//  Created by HAPPY on 10/02/25.
//
import SwiftUI
import Foundation

struct ProfileView1: View {
    @State private var notificationCount: Int = 3 // Example count
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Button(action: {
                    // Handle back action
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                
                Spacer()
        
                
              
                
                ZStack {
                    Image(systemName: "bell")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    if notificationCount > 0 {
                        ZStack {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 16, height: 16)
                            
                            Text("\(notificationCount)")
                                .font(.caption2)
                                .foregroundColor(.white)
                        }
                        .offset(x: 10, y: -10)
                    }
                }
                
                Circle()
                    
                    .fill(Color(hex: "#3858EF"))
                    .frame(width: 30, height: 30)
                    .overlay(
                        Text("S")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .bold)))
            }
            .padding()
            
            Divider()
            
            // Profile Section
            VStack {
                // Profile Image
                ZStack {
                    Image("Screenshot 2025-02-10 at 6.19.42 PM") // Replace with actual image asset
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 28, height: 28)
                        .overlay(
                            Image(systemName: "pencil")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        )
                        .offset(x: 35, y: 35)
                }
                
                // Profile Details
                VStack(alignment: .leading, spacing: 10) {
                    ProfileRow(label: "Name", value: "Sukhali Singh Aulakh")
                    ProfileRow(label: "Username", value: "SueAulakh")
                    ProfileRow(label: "Email", value: "sukhaliaulakh@gmail.com")
                    ProfileRow(label: "Password", value: "******")
                }
                .padding()
                
                // Edit Profile Button
                Button(action: {
                    // Handle edit action
                }) {
                    Text("Edit Profile")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 200, height: 45)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                .padding()
            }
           
            Spacer()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// Reusable Profile Row Component
struct ProfileRow1: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .foregroundColor(.black)
            
            Spacer()
            
            Text(value)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
        .overlay(Rectangle().frame(height: 1).foregroundColor(Color.gray.opacity(0.3)), alignment: .bottom)
    }
}

// Preview
struct ProfileView_Previews1: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
