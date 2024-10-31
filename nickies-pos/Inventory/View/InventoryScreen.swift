import SwiftUI

struct InventoryScreen: View {
  var body: some View {
    NavigationView {
      List {
        Section {
          NavigationLink(destination: Text("Cup Details")) {
            HStack {
              VStack(alignment: .leading) {
                Text("Cup")
              }
              Spacer()
              Text("4")
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
          }
          NavigationLink(destination: Text("Straw Details")) {
            HStack {
              VStack(alignment: .leading) {
                Text("Straw")
              }
              Spacer()
              Text("4")
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
          }
        }
      }
      .navigationTitle("Inventory")
      .toolbar {
        Button {
          
        } label: {
          Image(systemName: "plus")
        }
      }
      .padding(.vertical)
    }
  }
}

#Preview {
  InventoryScreen()
}
