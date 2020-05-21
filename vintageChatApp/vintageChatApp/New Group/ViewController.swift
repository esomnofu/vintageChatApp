//
//  ViewController.swift
//  vintageChatApp
//
//  Created by Malik on 21/05/2020.
//  Copyright © 2020 MrOfu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Chat Constants
    let SENDER_NAME = "Vintage Heights"
    let RECEIVER_NAME = "You"
    let TIME = "5, January 2020"

    //MARK: TableView
    lazy var tableView : UITableView = {
       let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    //MARK: toggle for sender and receiver
    var isSender = false
    
    //MARK: table sections
    var sections = ["PTA Meeting", "Comments"]
    
    //MARK: Auto populated chats
    lazy var chatMessagesArray : [Chat] = [
        Chat(message: "This is how a comment will look on the mobile application", isFromReceiver: false, name: SENDER_NAME, time: "5, January 2020"),
        
        Chat(message: "This is how a comment will look on the mobile application", isFromReceiver: true, name: RECEIVER_NAME, time: "5, January 2020")
    ]
    
    //MARK: UI Elements
    //msg text field
    let messageTextField : UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 24
        tf.layer.borderWidth = 0.5
        tf.setLeftPaddingPoints(30)
        tf.placeholder = "Leave a Comment"
        return tf
    }()
    
    //send button
    let sendButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "logo").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(addNewMessage), for: .touchUpInside)
        return btn
    }()
    
    @objc func addNewMessage(){
        guard let message = messageTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), message.count > 0 else {
            presentAlert(title: "message can't be empty")
            return
        }
        addChatToChatArray(message:message)
    }
    
    func addChatToChatArray(message:String) {
        //sort chat according to sender or receiver
        var chat : Chat?
        if isSender {
            chat = Chat(message:message, isFromReceiver: isSender, name:SENDER_NAME, time:TIME)
        }else{
            chat = Chat(message:message, isFromReceiver: isSender, name:RECEIVER_NAME, time:TIME)
        }
        //add chat to datasource
        if let chatMessage = chat {
            chatMessagesArray.append(chatMessage)
        }
        
        //reload tableView
        self.tableView.reloadData()
        //update header section
        sections[1] = "Comments (\(chatMessagesArray.count))"
        //scroll tableview to last comment
        self.tableView.scrollToRow(at: IndexPath(item: chatMessagesArray.count-1, section: 1), at: .bottom, animated: true)
        //empty message textfield
        messageTextField.text = ""
        //toggle sender
        isSender = !isSender
    }
    
    //MARK: Bottom View for adding new chat
    lazy var bottomView : UIView = {
        let uv = UIView()
        uv.backgroundColor = .lightGray
        
        //add and anchor sendbutton to bottom view
        uv.addSubview(sendButton)
        sendButton.anchor(top: nil, left: nil, bottom: nil, right: uv.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, height: 50, width: 50)
        sendButton.centerYAnchor.constraint(equalTo: uv.centerYAnchor).isActive = true
        
        //add and anchor textfield to bottom view
        uv.addSubview(messageTextField)
        messageTextField.anchor(top: nil, left: uv.leftAnchor, bottom: nil, right: sendButton.leftAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, height: 50, width: 0)
        messageTextField.centerYAnchor.constraint(equalTo: uv.centerYAnchor).isActive = true
        
        return uv
    }()
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
           //set up UI
           setupUI()
           //enable touch on screen to dismiss keyboard
           hideKeyboardWhenTappedAnywhere()
           //set view bg color & update comment section count label
           view.backgroundColor = .white
           sections[1] = "Comments (\(chatMessagesArray.count))"
           //set up tableview
           configureTableView()
           //add keyboard listeners
           addKeyboardObservers()
       }
    
    func configureTableView(){
        //register both cells for tableveiw
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.register(PtaTableViewCell.self, forCellReuseIdentifier: "identifier")
        //remove sepator style
        tableView.separatorStyle = .none
    }
    
    func addKeyboardObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

       @objc func keyboardWillShow(notification: NSNotification) {
           if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
               if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.size.height
               }
           }
       }

       @objc func keyboardWillHide(notification: NSNotification) {
           if self.view.frame.origin.y != 0 {
               self.view.frame.origin.y = 0
           }
       }
    
    func setupUI(){
        view.addSubview(bottomView)
        bottomView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 100, width: 0)
        
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: bottomView.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
    }
       
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {

      // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
          // #warning Incomplete implementation, return the number of sections
          return sections.count
      }
      
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
              return sections[section]
      }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = Section(rawValue: section)
            switch currentSection {
                case .pta:
                    return 1
                case .comment:
                    return chatMessagesArray.count
                case .none:
                    return 1
            }
      }

      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentSection = Section(rawValue: indexPath.section)
            switch currentSection {
                case .pta:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as! PtaTableViewCell
                     cell.backgroundColor = .orange
                     cell.selectionStyle = .none
                     return cell
                case .comment:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ChatTableViewCell
                    let chat = chatMessagesArray[indexPath.row]
                    cell.chat = chat
                    cell.selectionStyle = .none
                    return cell
                case .none:
                    return UITableViewCell()
        }
      }
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentSection = Section(rawValue: indexPath.section)
        switch currentSection {
            case .pta:
                return 200
            case .comment:
                return UITableView.automaticDimension
            case .none:
                return 200
        }
    }
      
}

//MARK: Enum for sections
enum Section : Int {
    case pta = 0
    case comment
}
