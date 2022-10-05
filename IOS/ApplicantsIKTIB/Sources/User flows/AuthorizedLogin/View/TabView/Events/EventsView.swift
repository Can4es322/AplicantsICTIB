import SwiftUI

struct EventsView: View {
	
	let insetText = EdgeInsets(top: 14, leading: 13, bottom: 0, trailing: 13)
	@StateObject var viewData = ServerHandler()
	@Binding var isAuthorization: Int
	
	var body: some View {
		VStack {
			ScrollView(.vertical, showsIndicators: false) {
				VStack {
					if viewData.eventsFuture.data.isEmpty {
						VStack(alignment: .center, spacing: 0) {
							Text(L10n.textEventsEmpty)
								.foregroundColor(Color(Asset.blue3.name))
								.font(.system(size: 20, weight: .semibold))
								.multilineTextAlignment(.center)
								
							Image(Asset.eventsEmpty.name)
								.resizable()
								.frame(maxWidth: 200, maxHeight: 150, alignment: .center)
						}
						.frame(maxWidth: .infinity, alignment: .center)
						.frame(height: 325)
						.overlay(
							RoundedRectangle(cornerRadius: 8)
								.stroke(Color(Asset.blue3.name), lineWidth: 2)
						)
						.background(.white)
						.padding(.trailing, 15)
					} else {
						ScrollView(.horizontal, showsIndicators: false) {
							HStack {
								ForEach(viewData.eventsFuture.data) {post in
									UpcomingEvents(placeHolderEventData: post, isAuthorization: $isAuthorization)
								}

								GeometryReader { reader -> Color in

									let minX = reader.frame(in: .global).minX

									let width = UIScreen.main.bounds.width / 15

									if viewData.events.meta.hasNextPage == true && minX < width {
										DispatchQueue.main.async {
											Task {
												try await viewData.loadMoreContentFutureEvents()
											}
										}
									}
									return Color.clear
								}
								.frame(width: 20, height: 20)
							}
						}
						.frame(maxHeight: 325)
					}
					
					ForEach(viewData.events.data) {post in
						CommonEvents(placeHolderEventData: post, isAuthorization: $isAuthorization)
					}

					GeometryReader { reader -> Color in
						
						let minY = reader.frame(in: .global).minY
						
						let height = UIScreen.main.bounds.height / 1.5
						
						if viewData.events.meta.hasNextPage == true && minY < height {
							DispatchQueue.main.async {
								Task {
									try await viewData.loadMoreContentEvents()
								}
							}
						}
						return Color.clear
					}
					.frame(width: 20, height: 20)
				}
				.padding(.leading, 13)
			}
			
			Spacer()
		}
		.navigationBarTitle("")
		.navigationBarHidden(true)
		.navigationBarBackButtonHidden(true)
		.task {
			Task {
				try await viewData.sendFutureEvents(numberTake: 3)
				try await viewData.sendEvents(numberTake: 5)
			}
		}
		.padding(.top, 15)
	}
}

struct Events_Previews: PreviewProvider {
	static var previews: some View {
		EventsView(isAuthorization: .constant(1))
	}
}
