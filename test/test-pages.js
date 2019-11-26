var expect  = require('chai').expect;
var request = require('request');
var should = require('chai').should();

it('Main page content', function(done) {
    request('http://localhost:3000' , function(error, response, body) {
        //expect(body).to.equal('Hello Changeds world 4!');
        expect(body).to.equal('Hello Changeds world 4!');
        should.exist(body)
        done();
    });
});

it('Check for one word "Hello" on browser ', function(done) {
    request('http://localhost:3000' , function(error, response, body) {
        let word = 'Hello'
        let string = body;
        let arr = string.split(' ')
        

         for(let i = 0; i < arr.length; i++) {
            if(word === arr[i]){
                // console.log('Test Passed')
                done();
                return;
                
            }
        }
        //console.log('Test Failed')
        should.not.exist('Hello')
        done();
        
        
    });
});