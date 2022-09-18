# InputField

The InputField implements all behaviors available that SwiftUI code plus 
some methods to better configurate the TextField.

## Usage

Since it uses UITextField as base of all implementation, you can define
any layout to it in your component.

```
import SwiftUI
import InputField

struct NewTextField: View {

  @EditingState var isEditing: Bool
  @Binding var text: String

  let prompt: String

  init(
    _ text: Binding<String>,
    prompt: String
  ) {
    self._text = text
    self.prompt = prompt
  }

    var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty {
        Text(prompt)
          .foregroundColor(.gray)
      }

      InputField(
        text: $text,
        // Properties below is UIKit UIColor and UIFont
        foregroundColor: .black,
        accentColor: .blue,
        font: .systemFont(ofSize: 16)
      )
      .frame(maxWidth: .infinity)
      .frame(height: 40)
      .editing($isEditing)
    }
    .padding()
    .cornerRadius(8)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .strokeBorder(
          isEditing ? .blue : .gray,
          lineWidth: 1
        )
    )
  }
}
```

