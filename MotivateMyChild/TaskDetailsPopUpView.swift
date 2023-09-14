////
////  TaskDetailsPopUpView.swift
////  MotivateMyChild
////
////  Created by Ankit Bharatiya on 9/13/23
////
//
//import SwiftUI
//
//struct TaskDetailPopupView: View {
//    // Properties to store the task details
//    let taskName: String
//  //  let taskDescription: String
//  //  let pointValue: Int
//    @Binding var isPresented: Task?
//
//    var body: some View {
//        ZStack {
//            Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
//
//            VStack(alignment: .center, spacing: 20) {
//                Text("Task Details")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.top, 20)
//
//                Text("Name: \(taskName)")
//                    .font(.headline)
//                    .padding(.bottom, 10)
//
////                Text("Description: \(taskDescription)")
////                    .font(.body)
////                    .multilineTextAlignment(.center)
////                    .padding(.bottom, 10)
////
////                Text("Points: \(pointValue)")
////                    .font(.headline)
////                
//                Button(action: {
//                    // Close the popup by setting isPresented to nil
//                                    self.isPresented = nil
//                }) {
//                    Text("Close")
//                        .font(.headline)
//                        .padding(.vertical, 10)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .padding(.horizontal, 20)
//                .padding(.bottom, 20)
//            }
//            .background(Color.white)
//            .cornerRadius(20)
//            .padding(.horizontal, 20)
//        }
//    }
//}
//
//struct TaskDetailPopupView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskDetailPopupView(taskName: "Sample Task",
//                         //   taskDescription: "Sample Description", //pointValue: 5,
//                            isPresented: .constant(nil))
//    }
//}
//
