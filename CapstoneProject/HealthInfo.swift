import SwiftUI

struct HealthInfo: View {
    var body: some View {
        ZStack {
                Color(red: 0.99, green: 0.69, blue: 0.64)
                .ignoresSafeArea()


            VStack(alignment: .center, spacing: 8) {
                Image("paris")
                    .renderingMode(.none)
                    .resizable(capInsets: EdgeInsets())
                    .aspectRatio(contentMode: .fit)
                Text("Paris!")
                    .font(.title)
                    .fontWeight(.bold)
                Text(" ")

                Text("Common Illnesses:")
                    .font(.title3)
                    .fontWeight(.bold)

                Text("- Respiratory infections: Common cold, Flu, Bronchitis")
                Text("- Gastrointestinal illnesses: Traveler’s Diarrhea")
                Text(" ")

                Text("Air Quality:")
                    .font(.title3)
                    .fontWeight(.bold)

                Text("- Occasional problems with air quality")
                Text(" ")
                Text("Other things to note:")
                    .font(.title3)
                    .fontWeight(.bold)

                Text("- Pickpocketing")
                Text("- Bedbugs and measles")
                Text("- Terrorist groups threatening the city")
            }
            .padding() // Optional: adds spacing from edges
        }
    }
}

#Preview {
    HealthInfo()
}
