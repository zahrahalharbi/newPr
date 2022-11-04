//
//  ContentView.swift
//  17-100
//
//  Created by WadiahAlbuhairi on 07/04/1444 AH.
//

import SwiftUI
import PassKit

struct Pay: View {
    var paymentHandler = PaymentHandler()
    var body: some View {
        ZStack {
            ZStack{
                Color("Color")
                   // .opacity(0.9)
                Color.black
                    .opacity(0.77)
            }.ignoresSafeArea()
            PaymentButton()
              //  .frame(width: 28, height: 40, alignment: .center)
                .frame(width: 300,height: 50, alignment: .center)
                .onTapGesture {
                    paymentHandler.startPayment(paymentSummaryItems: [PKPaymentSummaryItem(label: "Product", amount: 85)])
                }
        }
        
        
        
    }
    
    
    
    struct Pay_Previews: PreviewProvider {
        static var previews: some View {
            Pay()
        }
    }
}

import PassKit

class PaymentHandler: NSObject, ObservableObject {
    func startPayment(paymentSummaryItems: [PKPaymentSummaryItem]) {
        
        // Create our payment request
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest.merchantIdentifier = "merchant.de.xxx"
        paymentRequest.merchantCapabilities = .capability3DS
        paymentRequest.countryCode = "SA"
        paymentRequest.currencyCode = "SAR"
        paymentRequest.requiredShippingContactFields = [.phoneNumber, .emailAddress ]
        paymentRequest.supportedNetworks = [.masterCard, .visa,.mada]
        
        // Display our payment request
        let paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        paymentController.delegate = self
        paymentController.present(completion: { (presented: Bool) in })
    }
}


/**
 PKPaymentAuthorizationControllerDelegate conformance.
 */
extension PaymentHandler: PKPaymentAuthorizationControllerDelegate {

    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
        completion(.success)
        print("paymentAuthorizationController completion(.success)")
    }

    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        print("DidFinish")
    }
    
    func paymentAuthorizationControllerWillAuthorizePayment(_ controller: PKPaymentAuthorizationController) {
        print("WillAuthorizePayment")
    }

}

struct PaymentButton: UIViewRepresentable {
    func updateUIView(_ uiView: PKPaymentButton, context: Context) { }
    
    func makeUIView(context: Context) -> PKPaymentButton {
        return PKPaymentButton(paymentButtonType: .plain, paymentButtonStyle: .automatic)
    }
}
