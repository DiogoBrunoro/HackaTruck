import SwiftUI

struct FormView: View {
    // Campos do formulário
    @State private var name = ""
    @State private var cpf = ""
    @State private var rg = ""
    @State private var phone = ""
    @State private var naturalidade = ""
    @State private var birthDate = Date()
    @State private var address = ""
    @State private var neighborhood = ""
    @State private var city = ""
    @State private var postalCode = ""
    @State private var state = ""
    @State private var susCard = ""
    @State private var healthPlan = ""
    @State private var bloodType = ""
    @State private var doctorName = ""
    @State private var doctorPhone = ""
    @State private var emergencyContacts: [[String]] = Array(repeating: ["", ""], count: 3)
    @State private var medicalHistory = ""
    @State private var isAllergic = false
    @State private var allergyDetails = ""
    @State private var hasSeizures = false
    @State private var seizureDetails = ""
    @State private var feverMedication = ""
    @State private var surgeryDone = false
    @State private var surgeryDetails = ""
    @State private var healthIssues: [String: Bool] = [
        "Problema Renal": false,
        "Disritmia": false,
        "Hipoglicemia": false,
        "Hiperglicemia": false,
        "Problemas cardíacos": false,
        "Enxaqueca": false,
        "Diabetes": false,
        "Hipertensão": false,
        "Asma": false,
        "Epilepsia": false,
        "Rinite": false,
        "Úlcera": false,
        "Sonambulismo": false,
        "Sangramento nasal": false,
        "Dificuldade de cicatrização": false
    ]

    var body: some View {
        ZStack {
            Color.backgroundColor1.ignoresSafeArea()
            VStack{
                NavigationView {
                    Form {
                        personalSection
                        contactSection
                        healthPlanSection
                        doctorSection
                        emergencySection
                        historySection
                        issuesSection
                        
                        Section {
                            Button(action: saveForm) {
                                HStack {
                                    Spacer()
                                    Text("Salvar")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding()
                                .background(Color.vermelhoRed)
                                .cornerRadius(8)
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                    .scrollContentBackground(.hidden) 
                    .background(Color.backgroundColor1)
                    .navigationTitle("Ficha Médica")
                }
            }
            Spacer()
        }
    }


    var personalSection: some View {
        Section(header: Text("Informações Pessoais").font(.headline)) {
            VStack {
                TextField("Nome", text: $name)
                TextField("CPF", text: $cpf)
                TextField("RG", text: $rg)
                DatePicker("Data de Nascimento", selection: $birthDate, displayedComponents: .date)
                TextField("Naturalidade", text: $naturalidade)
            }
            .padding(.vertical, 5)
        }
        .listRowBackground(Color.gray.opacity(0.1))
    }

    var contactSection: some View {
        Section(header: Text("Contato e Endereço")) {
            VStack {
                TextField("Telefone", text: $phone)
                TextField("Endereço", text: $address)
                TextField("Bairro", text: $neighborhood)
                TextField("Cidade", text: $city)
                TextField("CEP", text: $postalCode)
                TextField("Estado", text: $state)
            }
            .padding(.vertical, 5)
        }
        .listRowBackground(Color.gray.opacity(0.1))
    }

    var healthPlanSection: some View {
        Section(header: Text("Plano de Saúde")) {
            VStack {
                TextField("Cartão SUS", text: $susCard)
                TextField("Plano de Saúde", text: $healthPlan)
                TextField("Tipo Sanguíneo", text: $bloodType)
            }
            .padding(.vertical, 5)
        }
        .listRowBackground(Color.gray.opacity(0.1))
    }

    var doctorSection: some View {
        Section(header: Text("Médico")) {
            VStack {
                TextField("Nome do Médico", text: $doctorName)
                TextField("Telefone do Médico", text: $doctorPhone)
            }
            .padding(.vertical, 5)
        }
        .listRowBackground(Color.gray.opacity(0.1))
    }

    var emergencySection: some View {
        Section(header: Text("Contatos de Emergência")) {
            VStack(alignment: .leading) {
                ForEach(0..<emergencyContacts.count, id: \.self) { index in
                    VStack(alignment: .leading) {
                        TextField("Nome/Parentesco", text: $emergencyContacts[index][0])
                        TextField("Telefone", text: $emergencyContacts[index][1])
                    }
                }
            }
            .padding(.vertical, 5)
        }
        .listRowBackground(Color.gray.opacity(0.1))
    }

    var historySection: some View {
        Section(header: Text("Histórico Médico")) {
            VStack {
                TextEditor(text: $medicalHistory)
                    .frame(minHeight: 80)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)))

                Toggle("É alérgico a medicamento?", isOn: $isAllergic)
                if isAllergic {
                    TextField("Qual medicamento?", text: $allergyDetails)
                }

                Toggle("Já teve ou tem convulsão?", isOn: $hasSeizures)
                if hasSeizures {
                    TextField("Detalhes da convulsão", text: $seizureDetails)
                }

                TextField("Em caso de febre, o que costuma tomar?", text: $feverMedication)

                Toggle("Já fez cirurgia?", isOn: $surgeryDone)
                if surgeryDone {
                    TextField("Detalhes da cirurgia", text: $surgeryDetails)
                }
            }
            .padding(.vertical, 5)
        }
        .listRowBackground(Color.gray.opacity(0.1))
    }

    var issuesSection: some View {
        Section(header: Text("Problemas de Saúde")) {
            VStack {
                ForEach(healthIssues.keys.sorted(), id: \.self) { issue in
                    Toggle(issue, isOn: Binding(
                        get: { healthIssues[issue] ?? false },
                        set: { healthIssues[issue] = $0 }
                    ))
                }
            }
            .padding(.vertical, 5)
        }
        .listRowBackground(Color.gray.opacity(0.1))
    }



    func saveForm() {
        let formData = FormData(
            name: name, cpf: cpf, rg: rg, phone: phone, naturalidade: naturalidade,
            address: address, neighborhood: neighborhood, city: city, postalCode: postalCode, state: state,
            susCard: susCard, healthPlan: healthPlan, bloodType: bloodType,
            doctorName: doctorName, doctorPhone: doctorPhone, emergencyContacts: emergencyContacts,
            medicalHistory: medicalHistory, allergyDetails: allergyDetails, seizureDetails: seizureDetails,
            feverMedication: feverMedication, surgeryDetails: surgeryDetails,
            isAllergic: isAllergic, hasSeizures: hasSeizures, surgeryDone: surgeryDone,
            birthDate: birthDate, healthIssues: healthIssues
        )

        if let data = try? JSONEncoder().encode(formData) {
            UserDefaults.standard.set(data, forKey: "formData")
        }
    }

    func loadForm() {
        if let data = UserDefaults.standard.data(forKey: "formData"),
           let savedData = try? JSONDecoder().decode(FormData.self, from: data) {
            name = savedData.name
            cpf = savedData.cpf
            rg = savedData.rg
            phone = savedData.phone
            naturalidade = savedData.naturalidade
            address = savedData.address
            neighborhood = savedData.neighborhood
            city = savedData.city
            postalCode = savedData.postalCode
            state = savedData.state
            susCard = savedData.susCard
            healthPlan = savedData.healthPlan
            bloodType = savedData.bloodType
            doctorName = savedData.doctorName
            doctorPhone = savedData.doctorPhone
            emergencyContacts = savedData.emergencyContacts
            medicalHistory = savedData.medicalHistory
            isAllergic = savedData.isAllergic
            allergyDetails = savedData.allergyDetails
            hasSeizures = savedData.hasSeizures
            seizureDetails = savedData.seizureDetails
            feverMedication = savedData.feverMedication
            surgeryDone = savedData.surgeryDone
            surgeryDetails = savedData.surgeryDetails
            birthDate = savedData.birthDate
            healthIssues = savedData.healthIssues
        }
    }
}

// MARK: - Modelo de dados
struct FormData: Codable {
    let name, cpf, rg, phone, naturalidade, address, neighborhood, city, postalCode, state: String
    let susCard, healthPlan, bloodType, doctorName, doctorPhone: String
    let emergencyContacts: [[String]]
    let medicalHistory, allergyDetails, seizureDetails, feverMedication, surgeryDetails: String
    let isAllergic, hasSeizures, surgeryDone: Bool
    let birthDate: Date
    let healthIssues: [String: Bool]
}

#Preview {
    FormView()
}
