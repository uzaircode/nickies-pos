import SwiftUI

struct NotesScreen: View {
  @State private var text: String = ""
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Add Note")
        .fontWeight(.semibold)
      TextEditorWithPlaceholder(text: $text)
      Spacer()
    }
    .padding()
    .toolbar {
      ToolbarItemGroup(placement: .navigationBarTrailing) {
        Spacer()
        Button("Save") {
          dismiss()
        }
      }
    }
  }
}

#Preview {
  NotesScreen()
}
