// worker.js

importScripts('https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.6.1/firebase-firestore.js');
importScripts('https://www.gstatic.com/firebasejs/8.6.1/firebase-storage.js');
const firebaseOptions = {
    apiKey: 'AIzaSyBJqidk6sggACIfnFlciEbCC08BMg4DJjg',
    appId: '1:975507745859:web:ac925e437c5340c8bdf8f6',
    messagingSenderId: '975507745859',
    projectId: 'my-portfolio-ac4c6',
    authDomain: 'my-portfolio-ac4c6.firebaseapp.com',
    storageBucket: 'my-portfolio-ac4c6.appspot.com',
    measurementId: 'G-69Q98KB0ZV',
};

firebase.initializeApp(firebaseOptions);

function getProfile() {
    return new Promise((resolve, reject) => {
        const productsRef = firebase.firestore().collection('profile');
        productsRef
            .doc("main-user")
            .get()
            .then((doc) => {
                if (doc.exists) {
                    const productData = doc.data();
                    resolve(productData);
                } else {
                    reject(new Error('Không tìm thấy profile'));
                }
            })
            .catch((error) => {
                reject(error);
            });
    });
}
 function getWork() {
    return new Promise((resolve, reject) => {
        const events =  firebase.firestore().collection('works')
        events.get().then((querySnapshot) => {
            const tempDoc = []
            querySnapshot.forEach((doc) => {
                tempDoc.push({ id: doc.id, ...doc.data() })
            })
            console.log(tempDoc)
            resolve(tempDoc);

        });
    });
}
function getOnlyWork(workId) {
    return new Promise((resolve, reject) => {
        const productsRef = firebase.firestore().collection('works')
        productsRef
            .doc(workId)
            .get()
            .then((doc) => {
                if (doc.exists) {
                    const productData = doc.data();
                    resolve(productData);
                } else {
                    reject(new Error('Không tìm thấy profile'));
                }
            })
            .catch((error) => {
                reject(error);
            });
    });
}
 function getGetInTouch() {
    return new Promise((resolve, reject) => {
        const events = firebase.firestore().collection('get-in-touch')
        events.get().then((querySnapshot) => {
            const tempDoc = []
            querySnapshot.forEach((doc) => {
                tempDoc.push({ id: doc.id, ...doc.data() })
            })
            console.log(tempDoc)
            // self.postMessage(tempDoc);
            resolve(tempDoc);

        });
    });
}
async function getAllImagesFromStorage(folderName, size) {
    const imageUrls = [];
    const storage = firebase.storage().ref();
    if (size != null) {
        for (const i of size) {
            const ref = storage.child(`image_profile/${folderName}/${i}`);
            const listResult = await ref.listAll();
            for (const item of listResult.items) {
                const source = await item.getDownloadURL();
                imageUrls.push({ source: source, size: i });
            }
        }
        console.log(imageUrls)

        return imageUrls;
    } else {
        const ref = storage.child(`image_profile/${folderName}`);
        const listResult = await ref.listAll();
        for (const item of listResult.items) {
            const source = await item.getDownloadURL();
            imageUrls.push({ source: source });
        }
        console.log(imageUrls)

        return imageUrls;
    }

}
async function getAllImageAndVideoProfileFromStorage() {

    const allUrls = [];
    const imageUrls = [];
    const thumbnailUrls =[];
    const storage = firebase.storage().ref();
    const refImage = storage.child('profile/image');
    const listResultImage = await refImage.listAll();
    for (const item of listResultImage.items) {
        const source = await item.getDownloadURL();
        const metadata = await item.getMetadata();
        imageUrls.push({ source: source, name: item.name, type: "image", uploadDate: metadata.timeCreated });
    }

    const refThumbnail = storage.child('profile/thumbnails');
    const listResultThumbnail = await refThumbnail.listAll();
    for (const item of listResultThumbnail.items) {
        const source = await item.getDownloadURL();
        const metadata = await item.getMetadata();

        thumbnailUrls.push({ source: source, name: item.name, type: "thumbnail", uploadDate: metadata.timeCreated });
    }
    imageUrls.sort((a, b) => new Date(b.uploadDate) - new Date(a.uploadDate));
    thumbnailUrls.sort((a, b) => new Date(b.uploadDate) - new Date(a.uploadDate));

    if (imageUrls.length<3){
        allUrls.push(...imageUrls);
        allUrls.push(...thumbnailUrls);
    }
    else if (thumbnailUrls.length>0){
        var  y=0;
        for (let i = 0; i < imageUrls.length; i++) {
            if ((i % 10 == 2 || i % 10 == 5) && y < thumbnailUrls.length){
                allUrls.push(thumbnailUrls[y]);
                allUrls.push(imageUrls[i]);
                y++;
            }
            else{
                allUrls.push(imageUrls[i]);
            }
        }
        if(y <thumbnailUrls.length){
            allUrls.push(...thumbnailUrls.slice(y));
        }
    }
    else if (thumbnailUrls.length==0){
        allUrls.push(...imageUrls);
        allUrls.push(...thumbnailUrls);
    }
    
    
    return allUrls;
}
async function searchVideosByName(name) {
        const storage = firebase.storage().ref();
        const videosRef = storage.child('profile/video');
    const listResultVideo = await videosRef.listAll();
    for (const item of listResultVideo.items) {
        if (item.name == name) {
            const source = await item.getDownloadURL();
            const metadata = await item.getMetadata();

            return { source: source, name: item.name, type:"video", uploadDate: metadata.timeCreated };
        }
    } 
}

function getProcess(workId) {
    return new Promise((resolve, reject) => {
        const events = firebase.firestore().collection('process')
        events.where("workId","==", workId) .get().then((querySnapshot) => {
            const tempDoc = []
            querySnapshot.forEach((doc) => {
                tempDoc.push({ id: doc.id, ...doc.data() })
            })
            console.log(tempDoc)
            resolve(tempDoc);

        });
    });
   
}



self.addEventListener('message', function (e) {
    const action = e.data;
    if (action.type === 'getProfile') {
        getProfile()
            .then((profile) => {
                self.postMessage(JSON.stringify(profile ));
            })
            .catch((error) => {
                console.error('Lỗi khi lấy Profile thất bại:', error);
            });
    }
    if (action.type === 'getGetInTouch') {
        getGetInTouch()
            .then((profile) => {
                self.postMessage(JSON.stringify(profile));
            })
            .catch((error) => {
                console.error('Lỗi khi lấy GetInTouch thất bại:', error);
            });
    }
    if (action.type === 'getWork') {
        getWork()
            .then((profile) => {
                self.postMessage(JSON.stringify(profile));
            })
            .catch((error) => {
                console.error('Lỗi khi lấy Work thất bại:', error);
            });
    }
    if (action.type === 'getOnlyWork') {
        const workId = action.workId;
        getOnlyWork(workId)
            .then((profile) => {
                self.postMessage(JSON.stringify(profile));

            })
            .catch((error) => {
                console.error('Lỗi khi lấy OnlyWork thất bại:', error);
            });
    }
    if (action.type === 'getProcess') {
        const workId = action.workId;
        getProcess(workId)
            .then((profile) => {
                self.postMessage(JSON.stringify(profile ));
            })
            .catch((error) => {
                console.error('Lỗi khi lấy Process thất bại:', error);
            });
    }
    if (action.type === 'getImage') {
        const folderName = action.folderName;
        const size = action.size;
        getAllImagesFromStorage(folderName, size)
            .then((profile) => {
                self.postMessage(JSON.stringify(profile));
            })
            .catch((error) => {
                console.error('Lỗi khi lấy Image thất bại:', error);
            });
    }
    if (action.type === 'getImageVideoProfile') {
        getAllImageAndVideoProfileFromStorage()
            .then((profile) => {
                self.postMessage(JSON.stringify(profile));
            })
            .catch((error) => {
                console.error('Lỗi khi lấy Image - Video Profile thất bại:', error);
            });
    }
    if (action.type === 'searchVideosByName') {
        const name = action.name;
        searchVideosByName(name)
            .then((profile) => {
                self.postMessage(JSON.stringify(profile));
            })
            .catch((error) => {
                console.error('Lỗi khi lấy Video Profile thất bại:', error);
            });
    }
    
});
