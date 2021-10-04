//
//  TextInputView.swift
//  swiftui-lab
//
//  Created by devhaute on 2021/10/03.
//

import SwiftUI

struct TextInput: View {
    @State private var id: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                TextField("아이디를 입력하세요.", text: $id)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                if id.count > 0 {
                    Button {
                        self.id = ""
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 25))
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            HStack {
                SecureField("비밀번호를 입력하세요.", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if password.count > 0 {
                    Button {
                        self.password = ""
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 25))
                            .foregroundColor(.secondary)
                    }
                }
            }
            Text("비밀번호: \(password)")
        }
        .padding(.horizontal, 50)
    }
}

struct TextInput_preview: PreviewProvider {
    static var previews: some View {
        TextInput()
    }
}
