//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Nopphadon Phanwong on 21/6/22.
//

import SwiftUI

struct DetailEditView: View {
    @State private var data = DailyScrum.Data()
    @State private var newAttendeesName = ""
    var body: some View{
        Form{
            Section(header: Text("Meeting Info")){
                TextField("Title", text: $data.title)
                HStack{
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1)
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) Minutes")
                        .accessibilityHidden(true)
                }
            }
            Section(header: Text("Attendees")){
                ForEach(data.attendees){ attendee in
                    Text(attendee.name)
                }
                .onDelete{ indices in
                    data.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee", text: $newAttendeesName)
                    Button(action: {
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: newAttendeesName)
                            data.attendees.append(attendee)
                            newAttendeesName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeesName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider{
    static var previews: some View{
        DetailEditView()
    }
}
