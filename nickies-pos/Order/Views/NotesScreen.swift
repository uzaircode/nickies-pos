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

struct TextEditorWithPlaceholder: View {
  @Binding var text: String
  
  var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty {
        VStack {
          Text("Notes about the order...")
            .padding(.top, 10)
            .padding(.leading, 10)
            .opacity(2.0)
            .bold()
          Spacer()
        }
      }
      VStack {
        TextEditor(text: $text)
          .scrollContentBackground(.hidden)
          .autocorrectionDisabled()
          .frame(height: 150)
          .background(Color(.systemGray5))
          .cornerRadius(10)
          .opacity(text.isEmpty ? 0.85 : 1)
        Spacer()
      }
    }
    .padding(10)
    .cornerRadius(20)
  }
}
