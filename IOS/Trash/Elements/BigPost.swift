import SwiftUI

struct BigPost: View {
    var placeHolderImage: URL
    var placeHolderTitle: String
    var placeHolderDate: String
    var placeHolderDescription: String

    var body: some View {
        NavigationLink(destination: NewTap(
            placeHolderImage: placeHolderImage,
            placeHolderTitle: placeHolderTitle,
            placeHolderDate: placeHolderDate,
            placeHolderDescription: placeHolderDescription )) {
                ZStack(alignment: .bottom) {
                    AsyncImage(url: placeHolderImage) { image in
                        image
                            .resizable()
                            .frame(maxWidth: 250, maxHeight: 450, alignment: .center)
                            .cornerRadius(10)

                    }placeholder: {
                        ProgressView()
                            .frame(maxWidth: 250, maxHeight: 450, alignment: .center)
                    }

                    VStack(alignment: .leading, spacing: 13) {
                        Text(placeHolderTitle)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 19, weight: .bold))

                        Text(placeHolderDate)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 11, weight: .regular))
                    }
                    .frame(maxWidth: 234, maxHeight: 124)
                    .background(
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    )
                    .padding(.bottom, 8)

                }

            }
            .foregroundColor(.black)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct BigPost_Previews: PreviewProvider {
    static var previews: some View {
        BigPost(
            placeHolderImage: URL(string: ".jpg")!,
            placeHolderTitle: "В ЮФУ ИКТИБ стартовал хакатон CyverGarden 2021",
            placeHolderDate: "Март 21, 2021",
            placeHolderDescription: "skdfjd sfklskdf")
    }
}
