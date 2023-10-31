import SwiftUI


let halloweenEmojis = ["👻", "🎃", "🕷️", "👹", "💀", "🕸️", "🧙", "🙀"]
let animalsEmoji = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼"]
let dessertEmoji = ["🍦", "🥧", "🧁", "🍰", "🎂", "🍮", "🍭", "🍬"]
struct ContentView: View {
    
    
    @State var cardCount = 16
    @State var currentTheme = (halloweenEmojis + halloweenEmojis).shuffled()
    
    var body: some View {

        VStack {
            header
            ScrollView {
                cards
            }
            .imageScale(.large)
            .font(.largeTitle)
            theme
        }
        .padding()
        
    }
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
            ForEach(0..<min(cardCount, currentTheme.count), id: \.self) { index in
                CardView(content: currentTheme[index])
                    .aspectRatio(27/40, contentMode: .fit)
            }
        }
        .foregroundColor(.black)
    }
    
    var theme :some View{
        HStack {
            Spacer()
            Button(action: {
                currentTheme = (halloweenEmojis + halloweenEmojis).shuffled()
            }) {
                VStack {
                    Image(systemName: "moon.circle.fill")
                        .font(.system(size: 35))
                    Text("Halloween")
                        .font(.system(size: 15))
                }
            }
            Spacer()
            Button(action: {
                currentTheme = (animalsEmoji + animalsEmoji).shuffled()
            }) {
                VStack {
                    Image(systemName: "lizard.fill")
                        .font(.system(size: 30))
                    Text("Animals")
                        .font(.system(size: 15))
                }
            }
            Spacer()
            Button(action: {
                currentTheme = (dessertEmoji + dessertEmoji).shuffled()
            }) {
                VStack {
                    Image(systemName: "birthday.cake.fill")
                        .font(.system(size: 35))
                    Text("Desserts")
                        .font(.system(size: 15))
                }
            }
            Spacer()
        }

    }
    
    var header :some View{
        Text("Memorize")
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding(.top)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(isFaceUp ? Color.white : Color.black)
                .overlay(
                    Text(isFaceUp ? content : "")
                        .font(.largeTitle)
                )
                .frame(width: 80, height: 120)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isFaceUp ? Color.black : Color.clear, lineWidth: 2)
                )
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
