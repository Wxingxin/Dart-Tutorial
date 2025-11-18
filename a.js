const PENDING = "pending";
const FULFILLED = "fulfilled";
const REJECTED = "rejected";

class Promise {
  constructor(executor) {
    this.state = PENDING;
    this.value = null;
    this.reason = null;
    this.onFulfilledsCallback = [];
    this.onRejectedsCallback = [];

    const fulfill = (value) => {
      if (this.state === PENDING) {
        this.state = FULFILLED;
        this.value = value;
        this.onFulfilledsCallback.forEach((cb) => cb());
      }
    };

    const reject  = (reason) => {
        if(this.state === PENDING){
            this.state = REJECTED
            this.reason = reason
            this.onRejectedsCallback.forEach(cb=>cb())
        }
    }

    try {
        executor(fulfill,reject)
    } catch (error) {
        reject(error)
    }
  }

  then(onFulfilled,onRejected){
    onFulfilled = typeof onFulfilled === "function" ? onFulfilled : v => v;
    onRejected = typeof onRejected === "function"? onRejected: (err) => {throw err}

    return new Promise((resolve,reject) => {
        if(this.state=== FULFILLED){
        
            try {
                const x = onFulfilled(this.value)
                resolve(x)
            } catch (error) {
                reject(error)
            }
        }

        if(this.state === REJECTED){
            queueMicrotask(() => {
                try {
                    const x = onFulfilled(this.value)
                    resolve(x)
                } catch (error) {
                    reject(error)
                }
            })
        }
    })
  }
}
